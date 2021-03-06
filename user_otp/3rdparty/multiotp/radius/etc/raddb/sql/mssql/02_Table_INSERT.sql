USE [radius]
GO

INSERT INTO [dbo].[radusergroup] ([UserName],[GroupName])
SELECT 'testuser','static'
UNION ALL
SELECT 'fredf','dynamic'
UNION ALL
SELECT 'barney','static'
UNION ALL
SELECT 'dialrouter','netdial'


INSERT INTO [dbo].[radcheck] ([UserName],[Attribute],[Value],[Op])
SELECT 'testuser','Cleartext-Password','testpw',':='
UNION ALL
SELECT 'fredf','Cleartext-Password','wilma',':='
UNION ALL
SELECT 'barney','Cleartext-Password','betty',':='
UNION ALL
SELECT 'dialrouter','Cleartext-Password','dialup',':='
      

INSERT INTO [dbo].[radgroupcheck] ([GroupName],[Attribute],[Value],[Op])
SELECT 'dynamic','Auth-Type','Local',':='
UNION ALL
SELECT 'static','Auth-Type','Local',':='
UNION ALL
SELECT 'netdial','Auth-Type','Local',':='
      
 
INSERT INTO [dbo].[radreply] ([UserName],[Attribute],[Value],[Op])
SELECT 'testuser','Framed-IP-Address','127.0.0.1',':='
UNION ALL
SELECT 'barney','Framed-IP-Address','1.2.3.4',':='
UNION ALL
SELECT 'dialrouter','Framed-IP-Address','2.3.4.1',':='
UNION ALL
SELECT 'dialrouter','Framed-IP-Netmask','255.255.255.255',':='
UNION ALL
SELECT 'dialrouter','Framed-Routing',' Broadcast-Listen',':='
UNION ALL
SELECT 'dialrouter','Framed-Route','2.3.4.0 255.255.255.248',':='
UNION ALL
SELECT 'dialrouter','Idle-Timeout','900',':='
 
 
INSERT INTO [dbo].[radgroupreply] ([GroupName],[Attribute],[Value],[Op],[prio])
SELECT 'dynamic','Framed-Compression','Van-Jacobsen-TCP-IP',':=',1
UNION ALL
SELECT 'dynamic','Framed-Protocol','PPP',':=',1
UNION ALL
SELECT 'dynamic','Service-Type','Framed-User',':=',1
UNION ALL
SELECT 'dynamic','Framed-MTU','1500',':=',1
UNION ALL
SELECT 'static','Framed-Protocol','PPP',':=',1
UNION ALL
SELECT 'static','Service-Type','Framed-User',':=',1
UNION ALL
SELECT 'static','Framed-Compression','Van-Jacobsen-TCP-IP',':=',1
UNION ALL
SELECT 'netdial','Service-Type','Framed-User',':=',1
UNION ALL
SELECT 'netdial','Framed-Protocol','PPP',':=',1