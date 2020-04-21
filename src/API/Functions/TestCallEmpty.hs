-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestCallEmpty where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data TestCallEmpty = 
 TestCallEmpty deriving (Show)

instance T.ToJSON TestCallEmpty where
 toJSON (TestCallEmpty {  }) =
  A.object [ "@type" A..= T.String "testCallEmpty" ]

instance T.FromJSON TestCallEmpty where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testCallEmpty" -> parseTestCallEmpty v
   _ -> mempty
  where
   parseTestCallEmpty :: A.Value -> T.Parser TestCallEmpty
   parseTestCallEmpty = A.withObject "TestCallEmpty" $ \o -> do
    return $ TestCallEmpty {  }