package task;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

public class JobScheduler extends HttpServlet{
	public void init(ServletConfig config) throws ServletException {
		super.init();
		try {
			//스케줄러 팩토리
			SchedulerFactory factory=new StdSchedulerFactory();
			//스케줄러 생성
			Scheduler scheduler;
			scheduler=factory.getScheduler();
			scheduler.start();
			//작업
			JobDetail jobDetail=JobBuilder.newJob(OrganizeFileJob.class).build();
			//규칙
			CronTrigger cronTrigger=TriggerBuilder.newTrigger()
					.withSchedule(CronScheduleBuilder.cronSchedule("0 0 2 * * ?"))
					.build();
			//스케줄러 작업, 규칙부여
			scheduler.scheduleJob(jobDetail,cronTrigger);
		} catch (SchedulerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}