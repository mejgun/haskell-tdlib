-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetCreatedPublicChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PublicChatType as PublicChatType

--main = putStrLn "ok"

data GetCreatedPublicChats = 
 GetCreatedPublicChats { _type :: PublicChatType.PublicChatType }  deriving (Show)

instance T.ToJSON GetCreatedPublicChats where
 toJSON (GetCreatedPublicChats { _type = _type }) =
  A.object [ "@type" A..= T.String "getCreatedPublicChats", "type" A..= _type ]



instance T.FromJSON GetCreatedPublicChats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getCreatedPublicChats" -> parseGetCreatedPublicChats v

   _ -> mempty ""
  where
   parseGetCreatedPublicChats :: A.Value -> T.Parser GetCreatedPublicChats
   parseGetCreatedPublicChats = A.withObject "GetCreatedPublicChats" $ \o -> do
    _type <- o A..: "type"
    return $ GetCreatedPublicChats { _type = _type }