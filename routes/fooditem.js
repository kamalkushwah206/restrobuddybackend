var express = require('express');
var router = express.Router();
var pool = require("./pool")
var upload = require('./multer.js')

router.get('/fetch_all_category', function (req, res, next) {
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





router.post('/submit_fooditem', upload.single('icon'), function (req, res, next) {
  console.log("Body", req.body)
  console.log("File", req.file)

  try {
    pool.query("insert into fooditem (restaurantid, categoryid, subcategoryid,foodname, foodtype, price, offerprice, ingredients, status, icon, createdat, updatedat,quantitytype) value(?,?,?,?,?,?,?,?,?,?,?,?,?)",
      [req.body.restaurantid,
      req.body.categoryid,
      req.body.subcategoryid,
      req.body.foodname,
      req.body.foodtype,
      req.body.price,
      req.body.offerprice,
      req.body.ingredients,
      req.body.status,
      req.file.filename,
      req.body.createdat,
      req.body.updatedat,
      req.body.quantitytype
      ], function (error, result) {
        if (error) {
          console.log("error", error)
          res.status(500).json({ data: [], message: 'Database error,Pls contact database administrator', status: false })
        }
        else {
          res.status(200).json({ data: result, message: 'Food Item Sucessfully Registerd....', status: true })
        }
      })
  }
  catch (e) {
    console.log("e:", e)
    res.status(500).json({ data: [], message: 'Critical error,Pls contact database administrator', status: false })
  }


});

router.get('/display_all_food', function (req, res) {
  try {
    pool.query("select F. *,(select C.categoryname from category C where F.categoryid=C.categoryid) as categoryname,(select sb.subcategoryname from subcategory sb where F.subcategoryid=sb.subcategoryid) as subcategoryname,(select r.restaurantname from restaurant r where F.restaurantid=r.restaurantid) as restaurantname from fooditem F", function (error, result) {
      if (error) {
        console.log("error", error)
        res.status(500).json({ data: [], message: 'Database error,Pls contact database administrator', status: false })
      }
      else {
        res.status(200).json({ data: result, message: 'Food Item Sucessfully Registerd....', status: true })
      }

    })
  }
  catch (e) {
    res.status(500).json({ data: [], message: 'Critical error,Pls contact database administrator', status: false })
  }
})

router.post('/edit_fooditem_data', function (req, res, next) {
  console.log("Body", req.body)
  console.log("File", req.file)

  try {
    pool.query("update fooditem set restaurantid=?, categoryid=?, subcategoryid=?,foodname=?, foodtype=?, price=?, offerprice=?, ingredients=?, status=?,createdat=?, updatedat=?,quantitytype=? where foodid=?",
      [req.body.restaurantid,
      req.body.categoryid,
      req.body.subcategoryid,
      req.body.foodname,
      req.body.foodtype,
      req.body.price,
      req.body.offerprice,
      req.body.ingredients,
      req.body.status,
      req.body.createdat,
      req.body.updatedat,
      req.body.quantitytype,
      req.body.foodid
      ], function (error, result) {
        if (error) {
          console.log("error", error)
          res.status(500).json({ data: [], message: 'Database error,Pls contact database administrator', status: false })
        }
        else {
          res.status(200).json({ data: result, message: 'Food Item Sucessfully Edited....', status: true })
        }
      })
  }
  catch (e) {
    console.log("e:", e)
    res.status(500).json({ data: [], message: 'Critical error,Pls contact database administrator', status: false })
  }


});
router.post('/delete_fooditem_data', function (req, res, next) {
  console.log("Body", req.body)
  console.log("File", req.file)

  try {
    pool.query("delete from fooditem where foodid=? ",
      [req.body.foodid], function (error, result) {
        if (error) {
          console.log("error", error)
          res.status(500).json({ data: [], message: 'Database error,Pls contact database administrator', status: false })
        }
        else {
          res.status(200).json({ data: result, message: 'Food Item Delete Sucessfully....', status: true })
        }
      })
  }
  catch (e) {
    console.log("e:", e)
    res.status(500).json({ data: [], message: 'Critical error,Pls contact database administrator', status: false })
  }


});

router.post('/edit_food_image', upload.single('picture'), function (req, res, next) {
  console.log("Body", req.body)

  try {
    pool.query("update fooditem set icon=? where foodid=?",
      [req.file.filename,
      req.body.foodid


      ], function (error, result) {
        if (error) {
          console.log("error", error)
          res.status(500).json({ data: [], message: 'Database error,Pls contact database administrator', status: false })
        }
        else {
          res.status(200).json({ data: result, message: 'Food Item Icon Edited Sucessfully....', status: true })
        }
      })
  }
  catch (e) {
    console.log("e:", e)
    res.status(500).json({ data: [], message: 'Critical error,Pls contact database administrator', status: false })
  }


});
module.exports = router;