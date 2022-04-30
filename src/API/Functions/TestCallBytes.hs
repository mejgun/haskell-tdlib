-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestCallBytes where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns the received bytes; for testing only. This is an offline method. Can be called before authorization 
-- 
-- __x__ Bytes to return
data TestCallBytes = 

 TestCallBytes { x :: Maybe String }  deriving (Eq)

instance Show TestCallBytes where
 show TestCallBytes { x=x } =
  "TestCallBytes" ++ U.cc [U.p "x" x ]

instance T.ToJSON TestCallBytes where
 toJSON TestCallBytes { x = x } =
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
    x <- o A..:? "x"
    return $ TestCallBytes { x = x }
 parseJSON _ = mempty
