-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetAccountTtl where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.AccountTtl as AccountTtl

-- |
-- 
-- Changes the period of inactivity after which the account of the current user will automatically be deleted 
-- 
-- __ttl__ New account TTL
data SetAccountTtl = 

 SetAccountTtl { ttl :: Maybe AccountTtl.AccountTtl }  deriving (Eq)

instance Show SetAccountTtl where
 show SetAccountTtl { ttl=ttl } =
  "SetAccountTtl" ++ cc [p "ttl" ttl ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SetAccountTtl where
 toJSON SetAccountTtl { ttl = ttl } =
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
 parseJSON _ = mempty
