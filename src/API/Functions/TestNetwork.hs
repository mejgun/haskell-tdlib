-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestNetwork where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Sends a simple network request to the Telegram servers; for testing only. Can be called before authorization
data TestNetwork = 

 TestNetwork deriving (Show, Eq)

instance T.ToJSON TestNetwork where
 toJSON (TestNetwork {  }) =
  A.object [ "@type" A..= T.String "testNetwork" ]

instance T.FromJSON TestNetwork where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testNetwork" -> parseTestNetwork v
   _ -> mempty
  where
   parseTestNetwork :: A.Value -> T.Parser TestNetwork
   parseTestNetwork = A.withObject "TestNetwork" $ \o -> do
    return $ TestNetwork {  }