-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditInlineMessageLiveLocation where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Location as Location
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

--main = putStrLn "ok"

data EditInlineMessageLiveLocation = 
 EditInlineMessageLiveLocation { location :: Location.Location, reply_markup :: ReplyMarkup.ReplyMarkup, inline_message_id :: String }  deriving (Show)

instance T.ToJSON EditInlineMessageLiveLocation where
 toJSON (EditInlineMessageLiveLocation { location = location, reply_markup = reply_markup, inline_message_id = inline_message_id }) =
  A.object [ "@type" A..= T.String "editInlineMessageLiveLocation", "location" A..= location, "reply_markup" A..= reply_markup, "inline_message_id" A..= inline_message_id ]



instance T.FromJSON EditInlineMessageLiveLocation where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "editInlineMessageLiveLocation" -> parseEditInlineMessageLiveLocation v

   _ -> mempty ""
  where
   parseEditInlineMessageLiveLocation :: A.Value -> T.Parser EditInlineMessageLiveLocation
   parseEditInlineMessageLiveLocation = A.withObject "EditInlineMessageLiveLocation" $ \o -> do
    location <- o A..: "location"
    reply_markup <- o A..: "reply_markup"
    inline_message_id <- o A..: "inline_message_id"
    return $ EditInlineMessageLiveLocation { location = location, reply_markup = reply_markup, inline_message_id = inline_message_id }