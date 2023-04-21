{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatBackground where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Background as Background
import qualified Utils as U

-- |
data ChatBackground = -- | Describes a background set for a specific chat @background The background @dark_theme_dimming Dimming of the background in dark themes, as a percentage; 0-100
  ChatBackground
  { -- |
    dark_theme_dimming :: Maybe Int,
    -- |
    background :: Maybe Background.Background
  }
  deriving (Eq)

instance Show ChatBackground where
  show
    ChatBackground
      { dark_theme_dimming = dark_theme_dimming_,
        background = background_
      } =
      "ChatBackground"
        ++ U.cc
          [ U.p "dark_theme_dimming" dark_theme_dimming_,
            U.p "background" background_
          ]

instance T.FromJSON ChatBackground where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatBackground" -> parseChatBackground v
      _ -> mempty
    where
      parseChatBackground :: A.Value -> T.Parser ChatBackground
      parseChatBackground = A.withObject "ChatBackground" $ \o -> do
        dark_theme_dimming_ <- o A..:? "dark_theme_dimming"
        background_ <- o A..:? "background"
        return $ ChatBackground {dark_theme_dimming = dark_theme_dimming_, background = background_}
  parseJSON _ = mempty

instance T.ToJSON ChatBackground where
  toJSON
    ChatBackground
      { dark_theme_dimming = dark_theme_dimming_,
        background = background_
      } =
      A.object
        [ "@type" A..= T.String "chatBackground",
          "dark_theme_dimming" A..= dark_theme_dimming_,
          "background" A..= background_
        ]
