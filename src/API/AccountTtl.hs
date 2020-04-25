-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AccountTtl where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data AccountTtl = 
 AccountTtl { days :: Maybe Int }  deriving (Show, Eq)

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
    days <- mconcat [ o A..:? "days", readMaybe <$> (o A..: "days" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ AccountTtl { days = days }