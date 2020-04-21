-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetStorageStatisticsFast where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetStorageStatisticsFast = 
 GetStorageStatisticsFast deriving (Show)

instance T.ToJSON GetStorageStatisticsFast where
 toJSON (GetStorageStatisticsFast {  }) =
  A.object [ "@type" A..= T.String "getStorageStatisticsFast" ]



instance T.FromJSON GetStorageStatisticsFast where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getStorageStatisticsFast" -> parseGetStorageStatisticsFast v

   _ -> mempty ""
  where
   parseGetStorageStatisticsFast :: A.Value -> T.Parser GetStorageStatisticsFast
   parseGetStorageStatisticsFast = A.withObject "GetStorageStatisticsFast" $ \o -> do
    return $ GetStorageStatisticsFast {  }