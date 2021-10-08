-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetDatabaseStatistics where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns database statistics
data GetDatabaseStatistics = 

 GetDatabaseStatistics deriving (Eq)

instance Show GetDatabaseStatistics where
 show GetDatabaseStatistics {  } =
  "GetDatabaseStatistics" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetDatabaseStatistics where
 toJSON GetDatabaseStatistics {  } =
  A.object [ "@type" A..= T.String "getDatabaseStatistics" ]

instance T.FromJSON GetDatabaseStatistics where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getDatabaseStatistics" -> parseGetDatabaseStatistics v
   _ -> mempty
  where
   parseGetDatabaseStatistics :: A.Value -> T.Parser GetDatabaseStatistics
   parseGetDatabaseStatistics = A.withObject "GetDatabaseStatistics" $ \o -> do
    return $ GetDatabaseStatistics {  }
 parseJSON _ = mempty
