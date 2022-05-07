{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.DeepLinkInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.FormattedText as FormattedText
import qualified Utils as U

data DeepLinkInfo = -- | Contains information about a tg: deep link @text Text to be shown to the user @need_update_application True, if the user must be asked to update the application
  DeepLinkInfo
  { -- |
    need_update_application :: Maybe Bool,
    -- |
    text :: Maybe FormattedText.FormattedText
  }
  deriving (Eq)

instance Show DeepLinkInfo where
  show
    DeepLinkInfo
      { need_update_application = need_update_application,
        text = text
      } =
      "DeepLinkInfo"
        ++ U.cc
          [ U.p "need_update_application" need_update_application,
            U.p "text" text
          ]

instance T.FromJSON DeepLinkInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "deepLinkInfo" -> parseDeepLinkInfo v
      _ -> fail ""
    where
      parseDeepLinkInfo :: A.Value -> T.Parser DeepLinkInfo
      parseDeepLinkInfo = A.withObject "DeepLinkInfo" $ \o -> do
        need_update_application_ <- o A..:? "need_update_application"
        text_ <- o A..:? "text"
        return $ DeepLinkInfo {need_update_application = need_update_application_, text = text_}
  parseJSON _ = fail ""

instance T.ToJSON DeepLinkInfo where
  toJSON
    DeepLinkInfo
      { need_update_application = need_update_application,
        text = text
      } =
      A.object
        [ "@type" A..= T.String "deepLinkInfo",
          "need_update_application" A..= need_update_application,
          "text" A..= text
        ]
