var express = require("express");
var router = express.Router();
var pool = require("./pool.js");
var multer = require("./multer.js");

router.post("/submit_timing", function (req, res, next) {
  try {
    console.log("Body", req.body);

    pool.query(
      "insert into timing(restaurantid, status,closetime,opentime ,createdat, updatedat)value(?,?,?,?,?,?)",
      [
        req.body.restaurantid,
        req.body.status,
        req.body.closetime,
        req.body.opentime,
        req.body.createdat,
        req.body.updatedat,
      ],
      function (error, result) {
        if (error) {
          console.log("error", error);
          res
            .status(500)
            .json({
              message: "Database error, Pls contact database administrator...",
              status: false,
            });
        } else {
          res
            .status(200)
            .json({ message: "Timing Show Successfully...", status: true });
        }
      }
    );
  } catch (e) {
    console.log("e", e);
    res
      .status(500)
      .json({
        data: [],
        message: "Critical error, Pls contact database administrator...",
        status: false,
      });
  }
});

router.get("/displayall_timing",function(req,res,next){
  try{
    pool.query("select * from timing",function(error,result){
      if(error){
        console.log("error",error)
        res.status(500).json({message:'Database error, Pls contact database administrator...',status:false})
       } 
        else
        {
        res.status(200).json({message:'Display Successfully...', data:result,status:true})
         }
    })
  }
  catch(e)

{
  res.status(500).json({message:'Database error, Pls contact database administrator...',status:false})
}

})



router.post('/Edit_timing', function(req, res, next) {
  console.log('Body',req.body )
  
  try{
   pool.query("update timing set restaurantid=?, status=?, closetime=?, opentime=?, updatedat=? Where timingid=? ",[
    req.body.restaurantid,
     req.body.status,
     req.body.closetime,
     req.body.opentime,
     req.body.updatedat,
     req.body.timingid
   ],function(error,result){
     if(error){
      console.log("error",error)
      res.status(500).json({message:'Database error, Pls contact database administrator...',status:false})
     } 
      else
      {
      res.status(200).json({message:'Time Data Edited Successfully...',status:true})
       }
      });
      }
    catch(e)
    {
      console.log("e",e)
      res.status(500).json({data:[],message:'Critical error, Pls contact database administrator...',status:false})
    }
  
   });

   router.post("/delete_timing", function (req, res, next) {
    console.log("body", req.body);
    
    try {
      pool.query(
        "delete from timing where timingid=?",
        [
          req.body.timingid,
       ],
        function (error, result) {
          if (error) {
            console.log("error", error);
            res.status(500).json({
              message: "Database error, Pls contact database administrator...",
              status: false,
            });
          } else {
            res.status(200).json({
              message: "Time Data Deleted successfull....",
              status: true,
            });
          }
        }
      );
    } catch (e) {
      console.log("e", e);
      res.status(500).json({
        data: [],
        message: "Critical error, Pls contact database administrator...",
        status: false,
      });
    }
  });
  

module.exports = router;
