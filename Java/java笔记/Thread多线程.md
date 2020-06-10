# Thread多线程

- 多线程竞争同一个资源模块需要加锁 lock或者synchronize ,否则线程不同步

- 如下代码描述了3中多线程的实现方式          

  - 继承Thread类重写run方法
  - 实现Runnable接口
  - 实现Callable接口：有返回值
  - 多线程同步执行需加锁和定义全局变量，不加锁导致变量值非同步
  - 多线程独自访问资源不需要定义全局变量

  ```java
  public class SubThread extends Thread {
      @Override
      public void run() {
          for (int i = 0; i <5 ; i++) {
              System.out.println(Thread.currentThread().getName()+"--"+i);
      }
  }
      
  public class SubRunnable implements Runnable {
      private int flag=5;
      public void run(){
          while(true) {
              test();
          }
      }
      private synchronized void test() {
          if (flag>0){
              System.out.println(Thread.currentThread().getName() + "--" + flag--);
          }
      }
  } 

  public class SubCallable implements Callable<String> {
      @Override
      public String call() throws Exception {
          return Thread.currentThread().getName();
      }
  }

  public static void main(String[] args) throws InterruptedException, ExecutionException {
          new SubThread().start();
          new SubThread().start();
          Thread.sleep(1000);
          System.out.println();

          SubRunnable sr = new SubRunnable();
          new Thread(sr).start();
          new Thread(sr).start();

          //创建线程池对象,静态方法调用 submit有返回值，execute没有返回值
          ExecutorService es = Executors.newFixedThreadPool(2);
          Future<String> f1 = es.submit(new SubCallable());
          Future<String> f2 = es.submit(new SubCallable());
          String s1 = f1.get();
          System.out.println(s1);

          //线程池提交线程
          es.execute(new SubThread());
  }
  ```

  ​


