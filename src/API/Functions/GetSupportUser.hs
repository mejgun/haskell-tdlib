-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSupportUser where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns a user that can be contacted to get support
data GetSupportUser = 

 GetSupportUser deriving (Eq)

instance Show GetSupportUser where
 show GetSupportUser {  } =
  "GetSupportUser" ++ U.cc [ ]

instance T.ToJSON GetSupportUser where
 toJSON GetSupportUser {  } =
  A.object [ "@type" A..= T.String "getSupportUser" ]

instance T.FromJSON GetSupportUser where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getSupportUser" -> parseGetSupportUser v
   _ -> mempty
  where
   parseGetSupportUser :: A.Value -> T.Parser GetSupportUser
   parseGetSupportUser = A.withObject "GetSupportUser" $ \o -> do
    return $ GetSupportUser {  }
 parseJSON _ = mempty
