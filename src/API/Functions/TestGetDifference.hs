-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestGetDifference where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Forces an updates.getDifference call to the Telegram servers; for testing only
data TestGetDifference = 

 TestGetDifference deriving (Show, Eq)

instance T.ToJSON TestGetDifference where
 toJSON (TestGetDifference {  }) =
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