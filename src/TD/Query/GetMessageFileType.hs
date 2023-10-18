module TD.Query.GetMessageFileType
  (GetMessageFileType(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns information about a file with messages exported from another application. Returns 'TD.Data.MessageFileType.MessageFileType'
data GetMessageFileType
  = GetMessageFileType
    { message_file_head :: Maybe T.Text -- ^ Beginning of the message file; up to 100 first lines
    }
  deriving (Eq, Show)

instance I.ShortShow GetMessageFileType where
  shortShow
    GetMessageFileType
      { message_file_head = message_file_head_
      }
        = "GetMessageFileType"
          ++ I.cc
          [ "message_file_head" `I.p` message_file_head_
          ]

instance AT.ToJSON GetMessageFileType where
  toJSON
    GetMessageFileType
      { message_file_head = message_file_head_
      }
        = A.object
          [ "@type"             A..= AT.String "getMessageFileType"
          , "message_file_head" A..= message_file_head_
          ]

