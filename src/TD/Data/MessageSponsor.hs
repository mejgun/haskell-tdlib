{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageSponsor where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatPhotoInfo as ChatPhotoInfo
import qualified TD.Data.MessageSponsorType as MessageSponsorType
import qualified Utils as U

-- |
data MessageSponsor = -- | Information about the sponsor of a message
  MessageSponsor
  { -- | Additional optional information about the sponsor to be shown along with the message
    info :: Maybe String,
    -- | Photo of the sponsor; may be null if must not be shown
    photo :: Maybe ChatPhotoInfo.ChatPhotoInfo,
    -- | Type of the sponsor
    _type :: Maybe MessageSponsorType.MessageSponsorType
  }
  deriving (Eq)

instance Show MessageSponsor where
  show
    MessageSponsor
      { info = info_,
        photo = photo_,
        _type = _type_
      } =
      "MessageSponsor"
        ++ U.cc
          [ U.p "info" info_,
            U.p "photo" photo_,
            U.p "_type" _type_
          ]

instance T.FromJSON MessageSponsor where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageSponsor" -> parseMessageSponsor v
      _ -> mempty
    where
      parseMessageSponsor :: A.Value -> T.Parser MessageSponsor
      parseMessageSponsor = A.withObject "MessageSponsor" $ \o -> do
        info_ <- o A..:? "info"
        photo_ <- o A..:? "photo"
        _type_ <- o A..:? "type"
        return $ MessageSponsor {info = info_, photo = photo_, _type = _type_}
  parseJSON _ = mempty

instance T.ToJSON MessageSponsor where
  toJSON
    MessageSponsor
      { info = info_,
        photo = photo_,
        _type = _type_
      } =
      A.object
        [ "@type" A..= T.String "messageSponsor",
          "info" A..= info_,
          "photo" A..= photo_,
          "type" A..= _type_
        ]
