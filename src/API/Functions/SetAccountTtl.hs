-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetAccountTtl where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.AccountTtl as AccountTtl

-- |
-- 
-- Changes the period of inactivity after which the account of the current user will automatically be deleted 
-- 
-- __ttl__ New account TTL
data SetAccountTtl = 
 SetAccountTtl { ttl :: Maybe AccountTtl.AccountTtl }  deriving (Show, Eq)

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
    ttl <- o A..:? "ttl"
    return $ SetAccountTtl { ttl = ttl }