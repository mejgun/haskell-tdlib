-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Date where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data Date = 
 Date { year :: Int, month :: Int, day :: Int }  deriving (Show)

instance T.ToJSON Date where
 toJSON (Date { year = year, month = month, day = day }) =
  A.object [ "@type" A..= T.String "date", "year" A..= year, "month" A..= month, "day" A..= day ]



instance T.FromJSON Date where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "date" -> parseDate v

   _ -> mempty ""
  where
   parseDate :: A.Value -> T.Parser Date
   parseDate = A.withObject "Date" $ \o -> do
    year <- o A..: "year"
    month <- o A..: "month"
    day <- o A..: "day"
    return $ Date { year = year, month = month, day = day }