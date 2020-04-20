-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestCallBytes where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TestCallBytes = 
 TestCallBytes { x :: String }  -- deriving (Show)

instance T.ToJSON TestCallBytes where
 toJSON (TestCallBytes { x = x }) =
  A.object [ "@type" A..= T.String "testCallBytes", "x" A..= x ]
-- testCallBytes TestCallBytes  { x :: String } 



instance T.FromJSON TestCallBytes where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testCallBytes" -> parseTestCallBytes v
  where
   parseTestCallBytes :: A.Value -> T.Parser TestCallBytes
   parseTestCallBytes = A.withObject "TestCallBytes" $ \o -> do
    x <- o A..: "x"
    return $ TestCallBytes { x = x }