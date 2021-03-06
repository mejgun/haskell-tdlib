-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TestBytes where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- A simple object containing a sequence of bytes; for testing only 
-- 
-- __value__ Bytes
data TestBytes = 

 TestBytes { value :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON TestBytes where
 toJSON (TestBytes { value = value }) =
  A.object [ "@type" A..= T.String "testBytes", "value" A..= value ]

instance T.FromJSON TestBytes where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testBytes" -> parseTestBytes v
   _ -> mempty
  where
   parseTestBytes :: A.Value -> T.Parser TestBytes
   parseTestBytes = A.withObject "TestBytes" $ \o -> do
    value <- o A..:? "value"
    return $ TestBytes { value = value }