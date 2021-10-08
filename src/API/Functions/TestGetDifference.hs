-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestGetDifference where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Forces an updates.getDifference call to the Telegram servers; for testing only
data TestGetDifference = 

 TestGetDifference deriving (Eq)

instance Show TestGetDifference where
 show TestGetDifference {  } =
  "TestGetDifference" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON TestGetDifference where
 toJSON TestGetDifference {  } =
  A.object [ "@type" A..= T.String "testGetDifference" ]

instance T.FromJSON TestGetDifference where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testGetDifference" -> parseTestGetDifference v
   _ -> mempty
  where
   parseTestGetDifference :: A.Value -> T.Parser TestGetDifference
   parseTestGetDifference = A.withObject "TestGetDifference" $ \o -> do
    return $ TestGetDifference {  }
 parseJSON _ = mempty
