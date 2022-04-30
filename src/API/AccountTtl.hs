-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AccountTtl where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Contains information about the period of inactivity after which the current user's account will automatically be deleted 
-- 
-- __days__ Number of days of inactivity before the account will be flagged for deletion; 30-366 days
data AccountTtl = 

 AccountTtl { days :: Maybe Int }  deriving (Eq)

instance Show AccountTtl where
 show AccountTtl { days=days } =
  "AccountTtl" ++ U.cc [U.p "days" days ]

instance T.ToJSON AccountTtl where
 toJSON AccountTtl { days = days } =
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
    days <- mconcat [ o A..:? "days", readMaybe <$> (o A..: "days" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ AccountTtl { days = days }
 parseJSON _ = mempty
