-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestCallString where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data TestCallString = 
 TestCallString { x :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON TestCallString where
 toJSON (TestCallString { x = x }) =
  A.object [ "@type" A..= T.String "testCallString", "x" A..= x ]

instance T.FromJSON TestCallString where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testCallString" -> parseTestCallString v
   _ -> mempty
  where
   parseTestCallString :: A.Value -> T.Parser TestCallString
   parseTestCallString = A.withObject "TestCallString" $ \o -> do
    x <- optional $ o A..: "x"
    return $ TestCallString { x = x }