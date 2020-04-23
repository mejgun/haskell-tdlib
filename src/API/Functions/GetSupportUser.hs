-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSupportUser where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetSupportUser = 
 GetSupportUser deriving (Show)

instance T.ToJSON GetSupportUser where
 toJSON (GetSupportUser {  }) =
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