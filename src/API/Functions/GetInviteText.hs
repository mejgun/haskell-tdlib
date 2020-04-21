-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetInviteText where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetInviteText = 
 GetInviteText deriving (Show)

instance T.ToJSON GetInviteText where
 toJSON (GetInviteText {  }) =
  A.object [ "@type" A..= T.String "getInviteText" ]

instance T.FromJSON GetInviteText where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getInviteText" -> parseGetInviteText v
   _ -> mempty
  where
   parseGetInviteText :: A.Value -> T.Parser GetInviteText
   parseGetInviteText = A.withObject "GetInviteText" $ \o -> do
    return $ GetInviteText {  }