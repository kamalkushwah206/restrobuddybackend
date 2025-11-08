var express = require('express');
var router = express.Router();
var pool = require("./pool")
var upload = require('./multer.js')

router.get('/fetch_all_subcategory', function (req, res, next) {
  try {
    pool.query("select * from category", function (error, result) {
      if (error) {
        res.status(500).json({ data: [], message: 'Database error,Pls contact database administrator', status: false })
      }
      else {
        res.status(200).json({ data: result, message: 'Sucessfull', status: true })
      }
    })
  }
  catch (e) {
    res.status(500).json({ data: [], message: 'Critical error,Pls contact database administrator', status: false })
  }
});

router.post('/fetch_all_subcategory_by_id', function (req, res, next) {
  try {
    pool.query("select * from subcategory where categoryid=?", [req.body.categoryid], function (error, result) {
      if (error) {
        res.status(500).json({ data: [], message: 'Database error,Pls contact database administrator', status: false })
      }
      else {
        res.status(200).json({ data: result, message: 'Sucessfull', status: true })
      }
    })
  }
  catch (e) {
    res.status(500).json({ data: [], message: 'Critical error,Pls contact database administrator', status: false })
  }
});




router.post('/submit_subcategory', upload.single("icon"), function (req, res, next) {
  console.log("Body", req.body)
  console.log("File", req.file)
  try {
    pool.query("insert into subcategory (restaurantid,categoryid,subcategoryname, icon,updatedat,createdat) value(?,?,?,?,?,?)",
      [req.body.restaurantid,
      req.body.categoryid,
      req.body.subcategoryname,
      req.file.filename,
      req.body.createdat,
      req.body.updatedat


      ], function (error, result) {
        if (error) {
          console.log("error", error)
          res.status(500).json({ data: [], message: 'Database error,Pls contact database administrator', status: false })
        }
        else {
          res.status(200).json({ data: result, message: 'SubCategory Sucessfully Registerd....', status: true })
        }
      })
  }
  catch (e) {
    
    console.log("e:", e)
    res.status(500).json({ data: [], message: 'Critical error,Pls contact database administrator', status: false })
  }


});
router.get('/display_all_subcategory', function (req, res) {
  try {
    pool.query("select s.*,(select c.categoryname from category c where c.categoryid=s.categoryid) as categoryname,(select R.restaurantname from restaurant R where R.restaurantid=s.restaurantid) as restaurantname from subcategory s", function (error, result) {
      if (error) {
        res.status(500).json({ message: 'Database error,Pls contact database administrator', status: false })
      }
      else {
        res.status(200).json({ message: ' Success ....', data: result, status: true })
      }
    })
  }
  catch (e) {
    res.status(500).json({ data: [], message: 'Critical error,Pls contact database administrator', status: false })
  }
})

router.post('/edit_subcategory_data', upload.single("icon"), function (req, res, next) {
  console.log("Body", req.body)
  console.log("File", req.file)
  try {
    pool.query("update  subcategory set restaurantid=?,categoryid=?,subcategoryname=?, updatedat=?,createdat=? where subcategoryid=?",
      [req.body.restaurantid,
      req.body.categoryid,
      req.body.subcategoryname,
      req.body.createdat,
      req.body.updatedat,
      req.body.subcategoryid

      ], function (error, result) {
        if (error) {
          console.log("error", error)
          res.status(500).json({ data: [], message: 'Database error,Pls contact database administrator', status: false })
        }
        else {
          res.status(200).json({ data: result, message: 'SubCategory Data Edited Sucessfully....', status: true })
        }
      })
  }
  catch (e) {
    console.log("e:", e)
    res.status(500).json({ data: [], message: 'Critical error,Pls contact database administrator', status: false })
  }


});
router.post('/delete_subcategory_data', function (req, res, next) {
  console.log("Body", req.body)

  try {
    pool.query("delete from subcategory where subcategoryid=?",
      [
        req.body.subcategoryid


      ], function (error, result) {
        if (error) {
          console.log("error", error)
          res.status(500).json({ data: [], message: 'Database error,Pls contact database administrator', status: false })
        }
        else {
          res.status(200).json({ data: result, message: 'Subcategory Data Deleted Sucessfully....', status: true })
        }
      })
  }
  catch (e) {
    console.log("e:", e)
    res.status(500).json({ data: [], message: 'Critical error,Pls contact database administrator', status: false })
  }


});
router.post('/edit_subcategory_image', upload.single('picture'), function (req, res, next) {
  console.log("Body", req.body)

  try {
    pool.query("update subcategory set icon=? where subcategoryid=?",
      [req.file.filename,
      req.body.subcategoryid


      ], function (error, result) {
        if (error) {
          console.log("error", error)
          res.status(500).json({ data: [], message: 'Database error,Pls contact database administrator', status: false })
        }
        else {
          res.status(200).json({ data: result, message: 'Sub Category Icon Edited Sucessfully....', status: true })
        }
      })
  }
  catch (e) {
    console.log("e:", e)
    res.status(500).json({ data: [], message: 'Critical error,Pls contact database administrator', status: false })
  }


});

module.exports = router;