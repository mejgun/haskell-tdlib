{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.MessageFileType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Contains information about a file with messages exported from another app
data MessageFileType
  = -- | The messages was exported from a private chat @name Name of the other party; may be empty if unrecognized
    MessageFileTypePrivate
      { -- |
        name :: Maybe String
      }
  | -- | The messages was exported from a group chat @title Title of the group chat; may be empty if unrecognized
    MessageFileTypeGroup
      { -- |
        title :: Maybe String
      }
  | -- | The messages was exported from a chat of unknown type
    MessageFileTypeUnknown
  deriving (Eq)

instance Show MessageFileType where
  show
    MessageFileTypePrivate
      { name = name
      } =
      "MessageFileTypePrivate"
        ++ U.cc
          [ U.p "name" name
          ]
  show
    MessageFileTypeGroup
      { title = title
      } =
      "MessageFileTypeGroup"
        ++ U.cc
          [ U.p "title" title
          ]
  show MessageFileTypeUnknown =
    "MessageFileTypeUnknown"
      ++ U.cc
        []

instance T.FromJSON MessageFileType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageFileTypePrivate" -> parseMessageFileTypePrivate v
      "messageFileTypeGroup" -> parseMessageFileTypeGroup v
      "messageFileTypeUnknown" -> parseMessageFileTypeUnknown v
      _ -> fail ""
    where
      parseMessageFileTypePrivate :: A.Value -> T.Parser MessageFileType
      parseMessageFileTypePrivate = A.withObject "MessageFileTypePrivate" $ \o -> do
        name_ <- o A..:? "name"
        return $ MessageFileTypePrivate {name = name_}

      parseMessageFileTypeGroup :: A.Value -> T.Parser MessageFileType
      parseMessageFileTypeGroup = A.withObject "MessageFileTypeGroup" $ \o -> do
        title_ <- o A..:? "title"
        return $ MessageFileTypeGroup {title = title_}

      parseMessageFileTypeUnknown :: A.Value -> T.Parser MessageFileType
      parseMessageFileTypeUnknown = A.withObject "MessageFileTypeUnknown" $ \o -> do
        return $ MessageFileTypeUnknown {}
  parseJSON _ = fail ""

instance T.ToJSON MessageFileType where
  toJSON
    MessageFileTypePrivate
      { name = name
      } =
      A.object
        [ "@type" A..= T.String "messageFileTypePrivate",
          "name" A..= name
        ]
  toJSON
    MessageFileTypeGroup
      { title = title
      } =
      A.object
        [ "@type" A..= T.String "messageFileTypeGroup",
          "title" A..= title
        ]
  toJSON MessageFileTypeUnknown =
    A.object
      [ "@type" A..= T.String "messageFileTypeUnknown"
      ]
