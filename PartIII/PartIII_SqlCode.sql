/* Subset orders with vendors with booking (sales activity) after the first booking day ever  */
SELECT * 
FROM `orders` as Ord
JOIN `bookings` as Bkg on Ord.vendor_id = Bkg.id 
WHERE brand = 'EF_GR'
   AND day_key >= (SELECT MIN(DATE(created_at))
                     FROM `bookings`)
