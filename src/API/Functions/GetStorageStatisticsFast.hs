-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetStorageStatisticsFast where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetStorageStatisticsFast = 
 GetStorageStatisticsFast -- deriving (Show)

instance T.ToJSON GetStorageStatisticsFast where
 toJSON (GetStorageStatisticsFast {  }) =
  A.object [ "@type" A..= T.String "getStorageStatisticsFast" ]
-- getStorageStatisticsFast GetStorageStatisticsFast 

