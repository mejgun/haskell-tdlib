module TD.Data.ProfileTab
  (ProfileTab(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes a tab shown in a user or a chat profile
data ProfileTab
  = ProfileTabPosts -- ^ A tab with stories posted by the user or the channel chat and saved to profile
  | ProfileTabGifts -- ^ A tab with gifts received by the user or the channel chat
  | ProfileTabMedia -- ^ A tab with photos and videos posted by the channel
  | ProfileTabFiles -- ^ A tab with documents posted by the channel
  | ProfileTabLinks -- ^ A tab with messages posted by the channel and containing links
  | ProfileTabMusic -- ^ A tab with audio messages posted by the channel
  | ProfileTabVoice -- ^ A tab with voice notes posted by the channel
  | ProfileTabGifs -- ^ A tab with animations posted by the channel
  deriving (Eq, Show)

instance I.ShortShow ProfileTab where
  shortShow ProfileTabPosts
      = "ProfileTabPosts"
  shortShow ProfileTabGifts
      = "ProfileTabGifts"
  shortShow ProfileTabMedia
      = "ProfileTabMedia"
  shortShow ProfileTabFiles
      = "ProfileTabFiles"
  shortShow ProfileTabLinks
      = "ProfileTabLinks"
  shortShow ProfileTabMusic
      = "ProfileTabMusic"
  shortShow ProfileTabVoice
      = "ProfileTabVoice"
  shortShow ProfileTabGifs
      = "ProfileTabGifs"

instance AT.FromJSON ProfileTab where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "profileTabPosts" -> pure ProfileTabPosts
      "profileTabGifts" -> pure ProfileTabGifts
      "profileTabMedia" -> pure ProfileTabMedia
      "profileTabFiles" -> pure ProfileTabFiles
      "profileTabLinks" -> pure ProfileTabLinks
      "profileTabMusic" -> pure ProfileTabMusic
      "profileTabVoice" -> pure ProfileTabVoice
      "profileTabGifs"  -> pure ProfileTabGifs
      _                 -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON ProfileTab where
  toJSON ProfileTabPosts
      = A.object
        [ "@type" A..= AT.String "profileTabPosts"
        ]
  toJSON ProfileTabGifts
      = A.object
        [ "@type" A..= AT.String "profileTabGifts"
        ]
  toJSON ProfileTabMedia
      = A.object
        [ "@type" A..= AT.String "profileTabMedia"
        ]
  toJSON ProfileTabFiles
      = A.object
        [ "@type" A..= AT.String "profileTabFiles"
        ]
  toJSON ProfileTabLinks
      = A.object
        [ "@type" A..= AT.String "profileTabLinks"
        ]
  toJSON ProfileTabMusic
      = A.object
        [ "@type" A..= AT.String "profileTabMusic"
        ]
  toJSON ProfileTabVoice
      = A.object
        [ "@type" A..= AT.String "profileTabVoice"
        ]
  toJSON ProfileTabGifs
      = A.object
        [ "@type" A..= AT.String "profileTabGifs"
        ]

