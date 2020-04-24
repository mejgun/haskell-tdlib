-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestCallBytes where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data TestCallBytes = 
 TestCallBytes { x :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON TestCallBytes where
 toJSON (TestCallBytes { x = x }) =
  A.object [ "@type" A..= T.String "testCallBytes", "x" A..= x ]

instance T.FromJSON TestCallBytes where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testCallBytes" -> parseTestCallBytes v
   _ -> mempty
  where
   parseTestCallBytes :: A.Value -> T.Parser TestCallBytes
   parseTestCallBytes = A.withObject "TestCallBytes" $ \o -> do
    x <- optional $ o A..: "x"
    return $ TestCallBytes { x = x }