-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AccountTtl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data AccountTtl = 
 AccountTtl { days :: Int }  -- deriving (Show)

instance T.ToJSON AccountTtl where
 toJSON (AccountTtl { days = days }) =
  A.object [ "@type" A..= T.String "accountTtl", "days" A..= days ]
-- accountTtl AccountTtl  { days :: Int } 



instance T.FromJSON AccountTtl where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "accountTtl" -> parseAccountTtl v
  where
   parseAccountTtl :: A.Value -> T.Parser AccountTtl
   parseAccountTtl = A.withObject "AccountTtl" $ \o -> do
    days <- o A..: "days"
    return $ AccountTtl { days = days }