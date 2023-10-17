module TD.Data.UserSupportInfo
  (UserSupportInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText
import qualified Data.Text as T

data UserSupportInfo
  = UserSupportInfo -- ^ Contains custom information about the user
    { message :: Maybe FormattedText.FormattedText -- ^ Information message
    , author  :: Maybe T.Text                      -- ^ Information author
    , date    :: Maybe Int                         -- ^ Information change date
    }
  deriving (Eq, Show)

instance I.ShortShow UserSupportInfo where
  shortShow UserSupportInfo
    { message = message_
    , author  = author_
    , date    = date_
    }
      = "UserSupportInfo"
        ++ I.cc
        [ "message" `I.p` message_
        , "author"  `I.p` author_
        , "date"    `I.p` date_
        ]

instance AT.FromJSON UserSupportInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "userSupportInfo" -> parseUserSupportInfo v
      _                 -> mempty
    
    where
      parseUserSupportInfo :: A.Value -> AT.Parser UserSupportInfo
      parseUserSupportInfo = A.withObject "UserSupportInfo" $ \o -> do
        message_ <- o A..:?  "message"
        author_  <- o A..:?  "author"
        date_    <- o A..:?  "date"
        pure $ UserSupportInfo
          { message = message_
          , author  = author_
          , date    = date_
          }
  parseJSON _ = mempty

