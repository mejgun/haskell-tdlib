-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestGetDifference where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TestGetDifference = 
 TestGetDifference -- deriving (Show)

instance T.ToJSON TestGetDifference where
 toJSON (TestGetDifference {  }) =
  A.object [ "@type" A..= T.String "testGetDifference" ]
-- testGetDifference TestGetDifference 



instance T.FromJSON TestGetDifference where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testGetDifference" -> parseTestGetDifference v
  where
   parseTestGetDifference :: A.Value -> T.Parser TestGetDifference
   parseTestGetDifference = A.withObject "TestGetDifference" $ \o -> do
    return $ TestGetDifference {  }