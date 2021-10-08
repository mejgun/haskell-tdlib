-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetStorageStatisticsFast where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Quickly returns approximate storage usage statistics. Can be called before authorization
data GetStorageStatisticsFast = 

 GetStorageStatisticsFast deriving (Eq)

instance Show GetStorageStatisticsFast where
 show GetStorageStatisticsFast {  } =
  "GetStorageStatisticsFast" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetStorageStatisticsFast where
 toJSON GetStorageStatisticsFast {  } =
  A.object [ "@type" A..= T.String "getStorageStatisticsFast" ]

instance T.FromJSON GetStorageStatisticsFast where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getStorageStatisticsFast" -> parseGetStorageStatisticsFast v
   _ -> mempty
  where
   parseGetStorageStatisticsFast :: A.Value -> T.Parser GetStorageStatisticsFast
   parseGetStorageStatisticsFast = A.withObject "GetStorageStatisticsFast" $ \o -> do
    return $ GetStorageStatisticsFast {  }
 parseJSON _ = mempty
