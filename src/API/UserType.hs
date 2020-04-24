-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.UserType where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data UserType = 
 UserTypeRegular 
 | UserTypeDeleted 
 | UserTypeBot { need_location :: Maybe Bool, inline_query_placeholder :: Maybe String, is_inline :: Maybe Bool, can_read_all_group_messages :: Maybe Bool, can_join_groups :: Maybe Bool }  
 | UserTypeUnknown deriving (Show, Eq)

instance T.ToJSON UserType where
 toJSON (UserTypeRegular {  }) =
  A.object [ "@type" A..= T.String "userTypeRegular" ]

 toJSON (UserTypeDeleted {  }) =
  A.object [ "@type" A..= T.String "userTypeDeleted" ]

 toJSON (UserTypeBot { need_location = need_location, inline_query_placeholder = inline_query_placeholder, is_inline = is_inline, can_read_all_group_messages = can_read_all_group_messages, can_join_groups = can_join_groups }) =
  A.object [ "@type" A..= T.String "userTypeBot", "need_location" A..= need_location, "inline_query_placeholder" A..= inline_query_placeholder, "is_inline" A..= is_inline, "can_read_all_group_messages" A..= can_read_all_group_messages, "can_join_groups" A..= can_join_groups ]

 toJSON (UserTypeUnknown {  }) =
  A.object [ "@type" A..= T.String "userTypeUnknown" ]

instance T.FromJSON UserType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "userTypeRegular" -> parseUserTypeRegular v
   "userTypeDeleted" -> parseUserTypeDeleted v
   "userTypeBot" -> parseUserTypeBot v
   "userTypeUnknown" -> parseUserTypeUnknown v
   _ -> mempty
  where
   parseUserTypeRegular :: A.Value -> T.Parser UserType
   parseUserTypeRegular = A.withObject "UserTypeRegular" $ \o -> do
    return $ UserTypeRegular {  }

   parseUserTypeDeleted :: A.Value -> T.Parser UserType
   parseUserTypeDeleted = A.withObject "UserTypeDeleted" $ \o -> do
    return $ UserTypeDeleted {  }

   parseUserTypeBot :: A.Value -> T.Parser UserType
   parseUserTypeBot = A.withObject "UserTypeBot" $ \o -> do
    need_location <- optional $ o A..: "need_location"
    inline_query_placeholder <- optional $ o A..: "inline_query_placeholder"
    is_inline <- optional $ o A..: "is_inline"
    can_read_all_group_messages <- optional $ o A..: "can_read_all_group_messages"
    can_join_groups <- optional $ o A..: "can_join_groups"
    return $ UserTypeBot { need_location = need_location, inline_query_placeholder = inline_query_placeholder, is_inline = is_inline, can_read_all_group_messages = can_read_all_group_messages, can_join_groups = can_join_groups }

   parseUserTypeUnknown :: A.Value -> T.Parser UserType
   parseUserTypeUnknown = A.withObject "UserTypeUnknown" $ \o -> do
    return $ UserTypeUnknown {  }