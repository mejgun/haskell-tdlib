-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.UserType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data UserType = 
 UserTypeRegular 
 | UserTypeDeleted 
 | UserTypeBot { need_location :: Bool, inline_query_placeholder :: String, is_inline :: Bool, can_read_all_group_messages :: Bool, can_join_groups :: Bool }  
 | UserTypeUnknown -- deriving (Show)

instance T.ToJSON UserType where
 toJSON (UserTypeRegular {  }) =
  A.object [ "@type" A..= T.String "userTypeRegular" ]

 toJSON (UserTypeDeleted {  }) =
  A.object [ "@type" A..= T.String "userTypeDeleted" ]

 toJSON (UserTypeBot { need_location = need_location, inline_query_placeholder = inline_query_placeholder, is_inline = is_inline, can_read_all_group_messages = can_read_all_group_messages, can_join_groups = can_join_groups }) =
  A.object [ "@type" A..= T.String "userTypeBot", "need_location" A..= need_location, "inline_query_placeholder" A..= inline_query_placeholder, "is_inline" A..= is_inline, "can_read_all_group_messages" A..= can_read_all_group_messages, "can_join_groups" A..= can_join_groups ]

 toJSON (UserTypeUnknown {  }) =
  A.object [ "@type" A..= T.String "userTypeUnknown" ]
-- userTypeRegular UserType 

-- userTypeDeleted UserType 

-- userTypeBot UserType  { need_location :: Bool, inline_query_placeholder :: String, is_inline :: Bool, can_read_all_group_messages :: Bool, can_join_groups :: Bool } 

-- userTypeUnknown UserType 

