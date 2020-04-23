-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetAccountTtl where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.AccountTtl as AccountTtl

data SetAccountTtl = 
 SetAccountTtl { ttl :: Maybe AccountTtl.AccountTtl }  deriving (Show)

instance T.ToJSON SetAccountTtl where
 toJSON (SetAccountTtl { ttl = ttl }) =
  A.object [ "@type" A..= T.String "setAccountTtl", "ttl" A..= ttl ]

instance T.FromJSON SetAccountTtl where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setAccountTtl" -> parseSetAccountTtl v
   _ -> mempty
  where
   parseSetAccountTtl :: A.Value -> T.Parser SetAccountTtl
   parseSetAccountTtl = A.withObject "SetAccountTtl" $ \o -> do
    ttl <- optional $ o A..: "ttl"
    return $ SetAccountTtl { ttl = ttl }