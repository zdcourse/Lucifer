import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Iterator;
import java.util.List;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.*;
import org.apache.hadoop.hbase.client.*;
import org.apache.hadoop.hbase.util.Bytes;
public class HBaseImportTest extends Thread {
    public Configuration config = HBaseConfiguration.create();
    public Table table;
    public Connection connection;
    public Admin admin;
    public HBaseImportTest() {
        try {
            this.connection = ConnectionFactory.createConnection();
            this.table = connection.getTable(TableName.valueOf("uid_cnt"));
            this.admin = connection.getAdmin();
        } catch (IOException var2) {
            var2.printStackTrace();
        }
    }
    public static void main(String[] args) throws Exception {
       if(args.length != 1) {
            throw new Exception("You must set input path!");
        } else {
            String fileName = args[0];
            HBaseImportTest test = new HBaseImportTest();
            test.importLocalFileToHBase(fileName);
         }
    }
    public void importLocalFileToHBase(String fileName) {
        long st = System.currentTimeMillis();
        BufferedReader br = null;
        try {
            br = new BufferedReader(new InputStreamReader(new FileInputStream(fileName)));
            String en2 = null;
            int count = 0;
            while((en2 = br.readLine()) != null) {
                ++count;
                this.put(en2);
                if(count % 1000 == 0) {
                    System.out.println(count);
                }
            }
        } catch (IOException var19) {
            var19.printStackTrace();
        } finally {
            if(br != null) {
                try {
                    br.close();
                } catch (IOException var18) {
                    var18.printStackTrace();
                }
            }
            try {
                this.table.close();
            } catch (IOException var17) {
                var17.printStackTrace();
            }
        }
        long var21 = System.currentTimeMillis();
        System.out.println("Total Time: " + (var21 - st) + " ms");
    }
    public void put(String line) throws IOException {
        String[] arr = line.split("\t", -1);
        if(arr.length == 2) {
            Put put = new Put(Bytes.toBytes(arr[0]));
            put.add(Bytes.toBytes("f1"), Bytes.toBytes("cnt"), Bytes.toBytes(arr[1]));
            this.table.put(put);
        }
    }
    public void get(String rowkey, String columnFamily, String column, int versions) throws IOException {
        long st = System.currentTimeMillis();
        Get get = new Get(Bytes.toBytes(rowkey));
        get.addColumn(Bytes.toBytes(columnFamily), Bytes.toBytes(column));
        Scan scanner = new Scan(get);
        scanner.setMaxVersions(versions);
        ResultScanner rsScanner = this.table.getScanner(scanner);
        Iterator en2 = rsScanner.iterator();
        while(en2.hasNext()) {
            Result  result = (Result)en2.next();
            List list = result.list();
            Iterator i$ = list.iterator();
            while(i$.hasNext()) {
                KeyValue kv = (KeyValue)i$.next();
                System.out.println(Bytes.toStringBinary(kv.getValue()) + "\t" + kv.getTimestamp());
            }
        }
        rsScanner.close();
        long en21 = System.currentTimeMillis();
        System.out.println("Total Time: " + (en21 - st) + " ms");
    }
}
