var express = require('express');
var router = express.Router();
var pool = require('./pool.js')
var upload = require('./multer.js')


router.post('/user_fetch_restaurant_by_city', function (req, res) {
    try {
        pool.query("select R.*,(select S.statename from states S where S.stateid=R.stateid) as statename,(select C.cityname from cities C where C.cityid=R.cityid) as cityname  from restaurant R where R.cityid=?", [req.body.cityid], function (error, result) {
            if (error) {
                console.log("error", error)
                res.status(500).json({ message: 'Database error, Pls contact database administrator...', status: false })
            }
            else {
                res.status(200).json({ message: 'Success', data: result, status: true })
            }

        })

    } catch (e) {

        res.status(500).json({ data: [], message: 'Critical error, Pls contact database administrator...', status: false })
    }

})


router.post('/user_fetch_ambience_by_city', function (req, res) {
    try {

        pool.query("select R.*,RP.*,t.*,(select S.statename from states S where S.stateid=R.stateid) as statename,(select C.cityname from cities C where C.cityid=R.cityid) as cityname  from restaurant R,restaurantpictures rp,timing t  where R.restaurantid=rp.restaurantid and R.restaurantid=t.restaurantid and rp.picturetype='Ambience' and R.cityid=?", [req.body.cityid], function (error, result) {
            if (error) {
                console.log("error", error)
                res.status(500).json({ message: 'Database error, Pls contact database administrator...', status: false })
            }
            else {
                res.status(200).json({ message: 'Success', data: result, status: true })
            }

        })

    } catch (e) {

        res.status(500).json({ data: [], message: 'Critical error, Pls contact database administrator...', status: false })
    }

})


router.post('/user_fetch_ambience_by_restaurantid', function (req, res) {
    try {
        pool.query("select R.*,RP.*,t.*,(select GROUP_CONCAT(c.categoryname) from category c where c.restaurantid=r.restaurantid limit 3) as listcategory, (select S.statename from states S where S.stateid=R.stateid) as statename,(select C.cityname from cities C where C.cityid=R.cityid) as cityname  from restaurant R,restaurantpictures rp,timing t  where R.restaurantid=rp.restaurantid and R.restaurantid=t.restaurantid and rp.picturetype='Ambience' and rp.restaurantid=?", [req.body.restaurantid], function (error, result) {
            if (error) {
                console.log("error", error)
                res.status(500).json({ message: 'Database error, Pls contact database administrator...', status: false })
            }
            else {
                // console.log(result)
                res.status(200).json({ message: 'Success', data: result[0], status: true })
            }

        })

    } catch (e) {

        res.status(500).json({ data: [], message: 'Critical error, Pls contact database administrator...', status: false })
    }

})

router.post('/fetch_category_count', function (req, res, next) {
    console.log("Body:", req.body)
    try {
        pool.query("select category.categoryid,category.categoryname,count(*) as count_category from category,subcategory where category.categoryid=subcategory.categoryid and category.restaurantid=? group by category.categoryid,category.categoryname ", [req.body.restaurantid], function (error, result) {
            if (error) {
                console.log(error)
                res.status(500).json({ data: [], message: 'Database error, Pls contact database administrator...', status: false })
            }
            else {
                // console.log(result)
                res.status(200).json({ data: result, message: 'Success', status: true })
            }

        })

    }
    catch (e) {

        res.status(500).json({ data: [], message: 'Critical error, Pls contact database administrator...', status: false })
    }

});

router.post('/fetch_all_food_by_category', function (req, res, next) {
    console.log("Body:", req.body)
    try {
        pool.query("select * from fooditem where categoryid=? and restaurantid=?", [req.body.categoryid, req.body.restaurantid], function (error, result) {
            if (error) {
                console.log(error)
                res.status(500).json({ data: [], message: 'Database error, Pls contact database administrator...', status: false })
            }
            else {
                // console.log(result)
                res.status(200).json({ data: result, message: 'Success', status: true })
            }
        })

    }
    catch (e) {

        res.status(500).json({ data: [], message: 'Critical error, Pls contact database administrator...', status: false })
    }

});





module.exports = router;