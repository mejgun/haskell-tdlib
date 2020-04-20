-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TestBytes where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TestBytes = 
 TestBytes { value :: String }  -- deriving (Show)

instance T.ToJSON TestBytes where
 toJSON (TestBytes { value = value }) =
  A.object [ "@type" A..= T.String "testBytes", "value" A..= value ]
-- testBytes TestBytes  { value :: String } 



instance T.FromJSON TestBytes where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testBytes" -> parseTestBytes v
  where
   parseTestBytes :: A.Value -> T.Parser TestBytes
   parseTestBytes = A.withObject "TestBytes" $ \o -> do
    value <- o A..: "value"
    return $ TestBytes { value = value }