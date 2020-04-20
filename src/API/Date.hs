-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Date where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data Date = 
 Date { year :: Int, month :: Int, day :: Int }  -- deriving (Show)

instance T.ToJSON Date where
 toJSON (Date { year = year, month = month, day = day }) =
  A.object [ "@type" A..= T.String "date", "year" A..= year, "month" A..= month, "day" A..= day ]
-- date Date  { year :: Int, month :: Int, day :: Int } 

