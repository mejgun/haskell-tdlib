-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AccountTtl where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data AccountTtl = 
 AccountTtl { days :: Maybe Int }  deriving (Show)

instance T.ToJSON AccountTtl where
 toJSON (AccountTtl { days = days }) =
  A.object [ "@type" A..= T.String "accountTtl", "days" A..= days ]

instance T.FromJSON AccountTtl where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "accountTtl" -> parseAccountTtl v
   _ -> mempty
  where
   parseAccountTtl :: A.Value -> T.Parser AccountTtl
   parseAccountTtl = A.withObject "AccountTtl" $ \o -> do
    days <- optional $ o A..: "days"
    return $ AccountTtl { days = days }