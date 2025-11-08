var express = require('express');
var router = express.Router();
var pool = require('./pool.js')
var upload = require('./multer.js')

/* GET home page. */

router.post('/submit_category', upload.single('fileicon'), function (req, res, next) {
    console.log("Body", req.body)
    console.log("Files", req.files)

    try {
        pool.query("insert into category (restaurantid, categoryname, icon, createdat, updatedat) values (?,?,?,?,?)", [req.body.restaurantid, req.body.categoryname, req.file.filename, req.body.createdat, req.body.updatedat], function (error, result) {
            if (error) { 
                console.log("error", error)
                res.status(500).json({ message: 'Database error,Pls contact database administrator....', status: false })
            }
            else {
                res.status(200).json({ message: 'Category Successfully Registerd....', status: true })
            }
        })
    }
    catch (e) {
        console.log("error", error)
        res.status(500).json({ data: [], message: 'Critical error,Pls contact database administrator....', status: false })
    }
})

router.get('/display_all', function (req, res) {
    try {
        pool.query("select C.*,(select R.restaurantname from restaurant R where R.restaurantid=C.restaurantid) as restaurantname from category C", function (error, result) {
            if (error) {
                console.log("error", error)
                res.status(500).json({ message: 'Database error,Pls contact database administrator....', status: false })
            }
            else {
                res.status(200).json({ message: 'Success', data: result, status: true })
            }

        })
    }
    catch (e) {
        console.log("error", e)
        res.status(500).json({ data: [], message: 'Critical error,Pls contact database administrator....', status: false })

    }
})


router.post('/delete_category_data', function (req, res, next) {
    console.log("Body", req.body)
    try {
        pool.query("delete from category where categoryid=? ", [
            req.body.categoryid
        ], function (error, result) {
            if (error) {
                console.log("error", error)
                res.status(500).json({ message: 'Database error,Pls contact database administrator....', status: false })
            }
            else {
                res.status(200).json({ message: 'category Data Deleted Successfully ...', status: true })
            }

        })
    }
    catch (e) {
        console.log("error", error)
        res.status(500).json({ data: [], message: 'Critical error,Pls contact database administrator....', status: false })

    }
});


router.post('/edit_category_data', function (req, res, next) {
    console.log("Body", req.body)

    try {
        pool.query("update category set restaurantid=?, categoryname=?, createdat=?, updatedat=? where categoryid=?", [req.body.restaurantid, req.body.categoryname, req.body.createdat, req.body.updatedat, req.body.categoryid], function (error, result) {
            if (error) {
                console.log("error", error)
                res.status(500).json({ message: 'Database error,Pls contact database administrator....', status: false })
            }
            else {
                res.status(200).json({ message: 'Category Successfully Registerd....', status: true })
            }
        })
    }
    catch (e) {
        console.log("error", e)
        res.status(500).json({ data: [], message: 'Critical error,Pls contact database administrator....', status: false })
    }
})

router.post('/edit_category_images', upload.single('picture'), function (req, res, next) {
    console.log("Body", req.body)

    try {



        pool.query("update category set icon=? where categoryid=?", [req.file.filename,
        req.body.categoryid
        ], function (error, result) {
            if (error) {
                console.log("error", error)
                res.status(500).json({ message: 'Database error,Pls contact database administrator....', status: false })
            }
            else {
                res.status(200).json({ message: `Category Icon image edited Successfully ...`, status: true })
            }

        })
    }

    catch (e) {
        console.log("error", error)
        res.status(500).json({ data: [], message: 'Critical error,Pls contact database administrator....', status: false })

    }
});

module.exports = router;