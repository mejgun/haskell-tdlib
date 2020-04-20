-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetAccountTtl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetAccountTtl = 
 GetAccountTtl -- deriving (Show)

instance T.ToJSON GetAccountTtl where
 toJSON (GetAccountTtl {  }) =
  A.object [ "@type" A..= T.String "getAccountTtl" ]
-- getAccountTtl GetAccountTtl 



instance T.FromJSON GetAccountTtl where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getAccountTtl" -> parseGetAccountTtl v
  where
   parseGetAccountTtl :: A.Value -> T.Parser GetAccountTtl
   parseGetAccountTtl = A.withObject "GetAccountTtl" $ \o -> do
    return $ GetAccountTtl {  }