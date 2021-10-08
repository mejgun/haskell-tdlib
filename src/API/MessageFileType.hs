-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageFileType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Contains information about a file with messages exported from another app
data MessageFileType = 
 -- |
 -- 
 -- The messages was exported from a private chat 
 -- 
 -- __name__ Name of the other party; may be empty if unrecognized
 MessageFileTypePrivate { name :: Maybe String }  |
 -- |
 -- 
 -- The messages was exported from a group chat 
 -- 
 -- __title__ Title of the group chat; may be empty if unrecognized
 MessageFileTypeGroup { title :: Maybe String }  |
 -- |
 -- 
 -- The messages was exported from a chat of unknown type
 MessageFileTypeUnknown deriving (Eq)

instance Show MessageFileType where
 show MessageFileTypePrivate { name=name } =
  "MessageFileTypePrivate" ++ cc [p "name" name ]

 show MessageFileTypeGroup { title=title } =
  "MessageFileTypeGroup" ++ cc [p "title" title ]

 show MessageFileTypeUnknown {  } =
  "MessageFileTypeUnknown" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON MessageFileType where
 toJSON MessageFileTypePrivate { name = name } =
  A.object [ "@type" A..= T.String "messageFileTypePrivate", "name" A..= name ]

 toJSON MessageFileTypeGroup { title = title } =
  A.object [ "@type" A..= T.String "messageFileTypeGroup", "title" A..= title ]

 toJSON MessageFileTypeUnknown {  } =
  A.object [ "@type" A..= T.String "messageFileTypeUnknown" ]

instance T.FromJSON MessageFileType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageFileTypePrivate" -> parseMessageFileTypePrivate v
   "messageFileTypeGroup" -> parseMessageFileTypeGroup v
   "messageFileTypeUnknown" -> parseMessageFileTypeUnknown v
   _ -> mempty
  where
   parseMessageFileTypePrivate :: A.Value -> T.Parser MessageFileType
   parseMessageFileTypePrivate = A.withObject "MessageFileTypePrivate" $ \o -> do
    name <- o A..:? "name"
    return $ MessageFileTypePrivate { name = name }

   parseMessageFileTypeGroup :: A.Value -> T.Parser MessageFileType
   parseMessageFileTypeGroup = A.withObject "MessageFileTypeGroup" $ \o -> do
    title <- o A..:? "title"
    return $ MessageFileTypeGroup { title = title }

   parseMessageFileTypeUnknown :: A.Value -> T.Parser MessageFileType
   parseMessageFileTypeUnknown = A.withObject "MessageFileTypeUnknown" $ \o -> do
    return $ MessageFileTypeUnknown {  }
 parseJSON _ = mempty
