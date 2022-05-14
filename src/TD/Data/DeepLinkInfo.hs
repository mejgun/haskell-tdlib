{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.DeepLinkInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.FormattedText as FormattedText
import qualified Utils as U

-- |
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
      { need_update_application = need_update_application_,
        text = text_
      } =
      "DeepLinkInfo"
        ++ U.cc
          [ U.p "need_update_application" need_update_application_,
            U.p "text" text_
          ]

instance T.FromJSON DeepLinkInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "deepLinkInfo" -> parseDeepLinkInfo v
      _ -> mempty
    where
      parseDeepLinkInfo :: A.Value -> T.Parser DeepLinkInfo
      parseDeepLinkInfo = A.withObject "DeepLinkInfo" $ \o -> do
        need_update_application_ <- o A..:? "need_update_application"
        text_ <- o A..:? "text"
        return $ DeepLinkInfo {need_update_application = need_update_application_, text = text_}
  parseJSON _ = mempty

instance T.ToJSON DeepLinkInfo where
  toJSON
    DeepLinkInfo
      { need_update_application = need_update_application_,
        text = text_
      } =
      A.object
        [ "@type" A..= T.String "deepLinkInfo",
          "need_update_application" A..= need_update_application_,
          "text" A..= text_
        ]
