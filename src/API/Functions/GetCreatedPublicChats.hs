-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetCreatedPublicChats where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PublicChatType as PublicChatType

-- |
-- 
-- Returns a list of public chats of the specified type, owned by the user 
-- 
-- __type__ Type of the public chats to return
data GetCreatedPublicChats = 

 GetCreatedPublicChats { _type :: Maybe PublicChatType.PublicChatType }  deriving (Show, Eq)

instance T.ToJSON GetCreatedPublicChats where
 toJSON (GetCreatedPublicChats { _type = _type }) =
  A.object [ "@type" A..= T.String "getCreatedPublicChats", "type" A..= _type ]

instance T.FromJSON GetCreatedPublicChats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getCreatedPublicChats" -> parseGetCreatedPublicChats v
   _ -> mempty
  where
   parseGetCreatedPublicChats :: A.Value -> T.Parser GetCreatedPublicChats
   parseGetCreatedPublicChats = A.withObject "GetCreatedPublicChats" $ \o -> do
    _type <- o A..:? "type"
    return $ GetCreatedPublicChats { _type = _type }