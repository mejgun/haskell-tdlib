-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestCallString where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns the received string; for testing only. This is an offline method. Can be called before authorization 
-- 
-- __x__ String to return
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
    x <- o A..:? "x"
    return $ TestCallString { x = x }