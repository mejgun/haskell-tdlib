-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckCreatedPublicChatsLimit where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PublicChatType as PublicChatType

--main = putStrLn "ok"

data CheckCreatedPublicChatsLimit = 
 CheckCreatedPublicChatsLimit { _type :: PublicChatType.PublicChatType }  -- deriving (Show)

instance T.ToJSON CheckCreatedPublicChatsLimit where
 toJSON (CheckCreatedPublicChatsLimit { _type = _type }) =
  A.object [ "@type" A..= T.String "checkCreatedPublicChatsLimit", "type" A..= _type ]
-- checkCreatedPublicChatsLimit CheckCreatedPublicChatsLimit  { _type :: PublicChatType.PublicChatType } 



instance T.FromJSON CheckCreatedPublicChatsLimit where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkCreatedPublicChatsLimit" -> parseCheckCreatedPublicChatsLimit v
  where
   parseCheckCreatedPublicChatsLimit :: A.Value -> T.Parser CheckCreatedPublicChatsLimit
   parseCheckCreatedPublicChatsLimit = A.withObject "CheckCreatedPublicChatsLimit" $ \o -> do
    _type <- o A..: "type"
    return $ CheckCreatedPublicChatsLimit { _type = _type }