-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetCreatedPublicChats where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.PublicChatType as PublicChatType

-- |
-- 
-- Returns a list of public chats of the specified type, owned by the user 
-- 
-- __type__ Type of the public chats to return
data GetCreatedPublicChats = 

 GetCreatedPublicChats { _type :: Maybe PublicChatType.PublicChatType }  deriving (Eq)

instance Show GetCreatedPublicChats where
 show GetCreatedPublicChats { _type=_type } =
  "GetCreatedPublicChats" ++ cc [p "_type" _type ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetCreatedPublicChats where
 toJSON GetCreatedPublicChats { _type = _type } =
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
 parseJSON _ = mempty
